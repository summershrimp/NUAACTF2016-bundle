#!/usr/bin/env python

"""task_import.py -- imports tasks from 'tasks.json' into the database"""

import dataset
import csv
import json
import sys
from werkzeug.security import generate_password_hash

if __name__ == '__main__':

    purge = False

    # Handle the optional purge argument
    if len(sys.argv) > 1:
        if sys.argv[1] == 'purge':

            purge = True
            print "[*] Purge mode is on, old tasks deleted"

    # Load the json structure
    users_file = file('users.csv', 'rb')
    users_csv = csv.reader(users_file)
    
    config_str = open('config.json', 'rb').read()
    config = json.loads(config_str)

    # Connect to database
    db = dataset.connect(config['db'])
    user_table = db['users']
    
    if purge:
        user_table.delete()

    # Parse the json file and add rows to the table
    old_user_count = len(list(user_table))

    update_user_count = 0
    
    # create users
    for u in users_csv:
        if not u[1].strip() and not u[2].strip() and not u[3].strip() :
            continue
            
        if user_table.find_one(username=u[1]):
            # Update existing table
            user_table.update({"username":u[1], "showname":u[2], "password":generate_password_hash(u[3])}, ['username'])
            update_user_count += 1

        else:
            user_table.insert({"username":u[1], "hidden":0, "showname":u[2], "password":generate_password_hash(u[3])})

    new_user_count = len(list(user_table))
    print "[*] Imported %d new tasks, updated %d users" % ((new_user_count - old_user_count), update_user_count)
