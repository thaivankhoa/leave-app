# LEAVE APP MANAGEMENT

***Integrate with users.codebox.vn***

- Users must login into Leave App by their users.codebox.vn account.

- When user login into Leave App for the first time, an user record will be created base on the user's information that was received from users.codebox.vn API.

- Add balance, taken, carried, wfh_day for user.

- Add header bar, navigation bar and login page.

***Request management***

**1.  Create request**

  - Association with user:
    + Basic association: User has many requests and a request belongs to a user.
    + Review-association: A request has many reviewers and a user has many pending requests.
    + CC-association: A request has many users that has been cc'd in it and a user has many cc-requests.

  - Association with duration (nested model):
    + A request has many durations and a duration belong to a request.
  
**2.  CRUD with request**

    - Ajaxified show, new, edit, update, approve and deny action.
    - Updated layouts and ajaxified some other parts of application employee dashboard, company 
    dashboard ...) 

**3.  Request workflow**

    - Request validation.
    - Check user's balance before creating request.
    - Check user's balance before approving a request.
    - Approve or deny a request.
    - Update the taken, carried, wfh days and balance value of a user after approving a request.

**4.  User authorization.**

    - Admin and owner of request can edit or delete a request.
    - Reviewers have the permission to change the status of request.
    - Admin can change carried, taken, wfh day of a user.

***What i've done will be updated here***
https://docs.google.com/spreadsheets/d/1rAoKXJnNBO404jBIXhtWPMy0k4a9rG63lpL1SiuQcas/edit#gid=1793730785

#COCOON GEM FOR NESTED FORM

