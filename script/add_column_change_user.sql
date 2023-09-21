alter table logs add (
                    change_user VARCHAR2(50) default user
                     );