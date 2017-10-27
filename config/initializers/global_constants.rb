module GlobalConstants
  Status = [['Available', 1], ['In use', 2], ['In maintenance', 3], ['Borrowed', 5],['Liquidated', 4]]
  AUTH_USER_URL = "http://user:3000/api/v1/authentications"
  LIST_USERS_URL = 'http://user:3000/api/v1/users'
  ADMIN = 'admin'
end
