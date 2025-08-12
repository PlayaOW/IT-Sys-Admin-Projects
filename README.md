# IT-Sys-Admin-Projects
# User Add Script
The script "createUser.sh" automates the proces of user creation of a new linux user with robust validation and security practices.
It ensures User IDs and Group IDs are available, numeric, and meet system standards.
This script manages permission and access to user file using chmod to ensure Principle of least privilege (PoLP)

# Feature
- Accepts all required field including user names, passwords, UID, GID.
- Validates UID and GID, whether they are available, numeric, and above 1000
- Creates a temporary directory for user until user is created.
- After user creation is successful, temporary directory and associated files are copied into user's home directory and then deleted.
- Applies secured permissions for these copied files in the user's home directory using chmod.

# Usage
- Run the script on linux (Debian/Ubuntu) with appropriate privileges

