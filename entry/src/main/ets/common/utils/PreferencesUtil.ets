import { preferences } from '@kit.ArkData';

const PREFERENCES_NAME = 'honysystem_prefs';

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
  return prefs.get('token', '') as string;
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

export async function getLoginInfo(context: Context): Promise<{
  roomNo: string;
  firstName: string;
  remember: boolean;
}> {
  const prefs = await getPrefs(context);
  return {
    roomNo: prefs.get('login_room_no', '') as string,
    firstName: prefs.get('login_first_name', '') as string,
    remember: prefs.get('login_remember', false) as boolean
  };
}

export async function clearLoginInfo(context: Context): Promise<void> {
  const prefs = await getPrefs(context);
  await prefs.delete('login_room_no');
  await prefs.delete('login_first_name');
  await prefs.delete('login_remember');
  await prefs.flush();
}
