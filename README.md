# Bulk Add LDAP users 
Steps: 
1. Clone the repo 
2. Ensure the shell script and the ldif file are in the directory 
3. Edit the shell script by adding your LDAP server credentials 
4. Make the script executabale : chmod +x <script_name>.sh 
5. Run the script 

Sample output 

~/bulk_ldap$ ./ldap_bulk_user.sh

adding new entry "uid=appd1,ou=uk,dc=appd,dc=com"

adding new entry "uid=appd2,ou=uk,dc=appd,dc=com"

adding new entry "uid=appd3,ou=uk,dc=appd,dc=com"
