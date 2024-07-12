from flask_login import UserMixin
from sqlalchemy import func
from datetime import datetime
from . import db

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    email = db.Column(db.String(30), unique=True)
    password = db.Column(db.String(20))
    name = db.Column(db.String(20), unique=True)

class SalesOrder(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    account_id = db.Column(db.String(10))
    stock_code = db.Column(db.String(20))
    issue = db.Column(db.String(10))
    required_date = db.Column(db.Date)
    required_quantity = db.Column(db.Integer)
    order_reference = db.Column(db.Integer)
    location = db.Column(db.String(10))
    message = db.Column(db.String(20))
    last_delivery_note = db.Column(db.Integer)
    last_delivery_date = db.Column(db.Date)
    week = db.Column(db.String(10))
    month = db.Column(db.String(20))
    unit_price = db.Column(db.Numeric(10, 2))
    sale_price = db.Column(db.Numeric(10, 2))

    class Meta:
        ordering = ['account_id', 'week', 'required_date']

    __table_args__ = (
        db.UniqueConstraint('account_id', 'stock_code', 'issue', 'required_date', 'required_quantity', name='unique_sales_order'),
    )

class Picklist(db.Model):
    account_id = db.Column(db.String(10), primary_key=True)
    stock_code = db.Column(db.String(20), primary_key=True)
    issue = db.Column(db.String(10), primary_key=True)
    required_date = db.Column(db.Date, primary_key=True)
    required_day = db.Column(db.String(10))
    required_quantity = db.Column(db.Integer, primary_key=True)
    order_reference = db.Column(db.Integer)
    location = db.Column(db.String(20))
    message = db.Column(db.String(20))
    week = db.Column(db.String(10))

    class Meta:
        ordering = ['account_id', 'week', 'required_date', 'required_day']

class CancelledList(db.Model):
    account_id = db.Column(db.String(10), primary_key=True)
    stock_code = db.Column(db.String(20), primary_key=True)
    issue = db.Column(db.String(10), primary_key=True)
    required_date = db.Column(db.Date, primary_key=True)
    required_day = db.Column(db.String(10))
    required_quantity = db.Column(db.Integer, primary_key=True)
    order_reference = db.Column(db.Integer)
    location = db.Column(db.String(20))
    message = db.Column(db.String(20))
    week = db.Column(db.String(10))

    class Meta:
        ordering = ['account_id', 'week', 'required_date', 'required_day']

class StockPrice(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    stock_code = db.Column(db.String(20), nullable=False)
    unit_price = db.Column(db.Numeric(10, 2), nullable=False)
    last_updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    def __repr__(self):
        return f"<StockPrice {self.stock_code}: £{self.unit_price}>"
    
class WeeklyForecasts(db.Model):
    __tablename__ = 'weekly_forecasts'
    account_id = db.Column(db.String(10), primary_key=True)
    Arrears = db.Column(db.Numeric(10, 2))
    # Add columns for Week - 1 to Week - 52
    for i in range(1, 53):
        locals()[f'Week - {i}'] = db.Column(db.Numeric(10, 2))

class WeeklyTotals(db.Model):
    __tablename__ = 'weekly_totals'
    account_id = db.Column(db.String(10), primary_key=True)
    Arrears = db.Column(db.Numeric(10, 2))
    Weeks_1_9 = db.Column(db.Numeric(10, 2), name='Weeks 1-9')
    Weeks_10_18 = db.Column(db.Numeric(10, 2), name='Weeks 10-18')
    Weeks_19_27 = db.Column(db.Numeric(10, 2), name='Weeks 19-27')
    Weeks_28_36 = db.Column(db.Numeric(10, 2), name='Weeks 28-36')
    Weeks_37_45 = db.Column(db.Numeric(10, 2), name='Weeks 37-45')
    Weeks_46_52 = db.Column(db.Numeric(10, 2), name='Weeks 46-52')

class MonthlyForecasts(db.Model):
    __tablename__ = 'monthly_forecasts'
    account_id = db.Column(db.String(10), primary_key=True)
    Arrears = db.Column(db.Numeric(10, 2))
    # Add columns for Month1 to Month12 and Month1_Value to Month12_Value
    for i in range(1, 13):
        locals()[f'Month{i}'] = db.Column(db.String(20))
        locals()[f'Month{i}_Value'] = db.Column(db.Numeric(10, 2))

class MonthlyTotals(db.Model):
    __tablename__ = 'monthly_totals'
    account_id = db.Column(db.String(10), primary_key=True)
    Arrears = db.Column(db.Numeric(10, 2))
    Months_1_6 = db.Column(db.Numeric(10, 2), name='Months 1-6')
    Months_7_12 = db.Column(db.Numeric(10, 2), name='Months 7-12')

class GrandTotal(db.Model):
    __tablename__ = 'grand_total'
    account_id = db.Column(db.String(10), primary_key=True)
    weekly_arrears = db.Column(db.Numeric(10, 2))
    weekly = db.Column(db.Numeric(10, 2))
    monthly_arrears = db.Column(db.Numeric(10, 2))
    monthly = db.Column(db.Numeric(10, 2))





