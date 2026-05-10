import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';
import { ApiResponse } from '../model/ApiResponse';

const BASE_URL = 'https://ohosiot.admitpro.cn';
const TIMEOUT = 10000;

let authToken: string = '';
let onUnauthorized: (() => void) | null = null;

export function setToken(token: string): void {
  authToken = token;
}

export function getStoredToken(): string {
  return authToken;
}

export function clearToken(): void {
  authToken = '';
}

export function setOnUnauthorized(callback: () => void): void {
  onUnauthorized = callback;
}

function showToast(message: string): void {
  promptAction.showToast({
    message: message,
    duration: 2000
  });
}

function handleHttpError(httpCode: number): void {
  switch (httpCode) {
    case 401:
      clearToken();
      if (onUnauthorized) {
        onUnauthorized();
      }
      showToast('登录已过期，请重新登录');
      break;
    case 403:
      showToast('权限不足，请联系前台');
      break;
    case 404:
      showToast('服务暂不可用');
      break;
    case 500:
      showToast('服务器繁忙，请稍后再试');
      break;
    default:
      showToast('网络连接失败');
      break;
  }
}

async function httpRequest<T>(
  endpoint: string,
  method: http.RequestMethod,
  body?: object
): Promise<ApiResponse<T>> {
  const httpClient = http.createHttp();

  try {
    const headers: Record<string, string> = {
      'Content-Type': 'application/json'
    };
    if (authToken) {
      headers['Authorization'] = `Bearer ${authToken}`;
    }

    const requestOptions: http.HttpRequestOptions = {
      method: method,
      header: headers,
      connectTimeout: TIMEOUT,
      readTimeout: TIMEOUT
    };

    if (body) {
      requestOptions.extraData = JSON.stringify(body);
    }

    const response = await httpClient.request(`${BASE_URL}${endpoint}`, requestOptions);

    if (response.responseCode === 200) {
      const result = JSON.parse(response.result as string) as ApiResponse<T>;
      if (result.code !== 0) {
        showToast(result.msg || '操作失败');
      }
      return result;
    } else {
      handleHttpError(response.responseCode);
      return {
        code: response.responseCode,
        msg: '请求失败',
        data: undefined as T,
        success: false
      };
    }
  } catch (err) {
    showToast('网络连接失败');
    return {
      code: -1,
      msg: '网络连接失败',
      data: undefined as T,
      success: false
    };
  } finally {
    httpClient.destroy();
  }
}

export async function get<T>(endpoint: string, params?: Record<string, string>): Promise<ApiResponse<T>> {
  let url = endpoint;
  if (params && Object.keys(params).length > 0) {
    const query = Object.entries(params)
      .map(([k, v]) => `${encodeURIComponent(k)}=${encodeURIComponent(v)}`)
      .join('&');
    url = `${endpoint}?${query}`;
  }
  return httpRequest<T>(url, http.RequestMethod.GET);
}

export async function post<T>(endpoint: string, body?: object): Promise<ApiResponse<T>> {
  return httpRequest<T>(endpoint, http.RequestMethod.POST, body);
}
