from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import event, text
from flask_login import LoginManager
from flask_migrate import Migrate

# init SQLAlchemy so we can use it later in our models
db = SQLAlchemy()
migrate = Migrate()

def create_app():
    app = Flask(__name__, static_folder='static', static_url_path='/static')
    app.config['SECRET_KEY'] = 'rama-1234-5678'  # Set the secret key
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:admin123@localhost/datamile'
    app.config['SQLALCHEMY_POOL_RECYCLE'] = {
        'pool_size': 10,
        'pool_recycle': 280,
    }
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ECHO'] = True

    db.init_app(app)
    migrate.init_app(app, db)

    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)
    login_manager.secret_key = app.config['SECRET_KEY']  # Pass the secret key to LoginManager

    from .models import User

    @login_manager.user_loader
    def load_user(user_id):
        # since the user_id is just the primary key of our user table, use it in the query for the user
        return User.query.get(int(user_id))

    # blueprint for auth routes in our app
    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    # blueprint for non-auth parts of app
    from project.main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    # Create the tables
    with app.app_context():
        db.create_all()
        db.session.execute(text("CALL update_week_column()"))
        db.session.execute(text("CALL create_picklist()"))
        db.session.execute(text("CALL create_cancelled_list()"))
        db.session.execute(text("CALL generate_forecasts()"))
        db.session.commit()

        # Check if the default user already exists
        default_user = User.query.filter_by(name='admin').first()
        if not default_user:
            # Create the default user
            default_user = User(email='admin@ecam.co.uk', name='admin', password='admin')
            db.session.add(default_user)
            db.session.commit()              

    return app

