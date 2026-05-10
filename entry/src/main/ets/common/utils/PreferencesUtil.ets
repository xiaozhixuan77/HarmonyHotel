import { preferences } from '@kit.ArkData';

const PREFERENCES_NAME = 'honysystem_prefs';

export interface LoginInfo {
  roomNo: string;
  firstName: string;
  remember: boolean;
}

async function getPrefs(context: Context): Promise<preferences.Preferences> {
  return preferences.getPreferences(context, PREFERENCES_NAME);
}

export async function saveToken(context: Context, token: string): Promise<void> {
  const prefs = await getPrefs(context);
  await prefs.put('token', token);
  await prefs.flush();
}

export async function getToken(context: Context): Promise<string> {
  const prefs = await getPrefs(context);
  const value = await prefs.get('token', '');
  return value as string;
}

export async function deleteToken(context: Context): Promise<void> {
  const prefs = await getPrefs(context);
  await prefs.delete('token');
  await prefs.flush();
}

export async function saveLoginInfo(
  context: Context,
  roomNo: string,
  firstName: string
): Promise<void> {
  const prefs = await getPrefs(context);
  await prefs.put('login_room_no', roomNo);
  await prefs.put('login_first_name', firstName);
  await prefs.put('login_remember', true);
  await prefs.flush();
}

export async function getLoginInfo(context: Context): Promise<LoginInfo> {
  const prefs = await getPrefs(context);
  const roomNo = await prefs.get('login_room_no', '');
  const firstName = await prefs.get('login_first_name', '');
  const remember = await prefs.get('login_remember', false);
  return {
    roomNo: roomNo as string,
    firstName: firstName as string,
    remember: remember as boolean
  };
}

export async function clearLoginInfo(context: Context): Promise<void> {
  const prefs = await getPrefs(context);
  await prefs.delete('login_room_no');
  await prefs.delete('login_first_name');
  await prefs.delete('login_remember');
  await prefs.flush();
}
