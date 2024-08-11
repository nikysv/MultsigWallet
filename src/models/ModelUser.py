from .entities.User import User

class ModelUser:

    @classmethod
    def login(self, db, user):
        try:
            cursor = db.connection.cursor()
            sql = ("SELECT id, username, password, fullname FROM user "
                   "WHERE username = '{}'").format(user.username)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row is not None:
                if row[2] == user.password:  # Comparación directa de contraseñas
                    logged_user = User(row[0], row[1], True, row[3])
                    return logged_user
                else:
                    return None  # Contraseña incorrecta
            else:
                return None  # Usuario no encontrado
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_by_id(self, db, id):
        try:
            cursor = db.connection.cursor()
            sql = "SELECT id, username, fullname FROM user WHERE id = {}".format(id)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row is not None:
                return User(row[0], row[1], None, row[2])
            else:
                return None
        except Exception as ex:
            raise Exception(ex)
