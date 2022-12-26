export type UserLogin = {
  userName: string,
  password?: string,
};

export type User = {
  id?: string,
  firstName: string,
  lastName: string,
  active: boolean,
  roleId: string
} & UserLogin;
