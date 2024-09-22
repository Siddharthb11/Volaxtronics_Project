from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Products(models.Model):
    name = models.CharField(max_length=50)
    price = models.FloatField()
    details = models.TextField()

    BRAND = (
        ('Samsung','Samsung'),
        ('Acer','Acer'),
        ('Asus','Asus')
    )
    brand = models.CharField(choices = BRAND, max_length=7)

    CATEGORIES = (
        ('Mobiles','Mobiles'),
        ('TVs','TVs'),
        ('Laptops','Laptops'),
        ('Home Appliances','Home Appliances')
    )
    category = models.CharField(choices = CATEGORIES, max_length=15)

    is_active = models.BooleanField()
    rating = models.FloatField()
    image = models.ImageField(upload_to='image/')

    def __str__(self):
        msg = self.name+" added successfully!"
        return msg

class Cart(models.Model):
    uid = models.ForeignKey(User, on_delete = models.CASCADE, db_column="uid")
    pid = models.ForeignKey(Products, on_delete = models.CASCADE, db_column="pid")
    quantity = models.IntegerField(default=1)

class Order(models.Model):
    order_id = models.CharField(max_length=50)
    uid = models.ForeignKey(User, on_delete = models.CASCADE, db_column="uid")
    pid = models.ForeignKey(Products, on_delete = models.CASCADE, db_column="pid")
    quantity = models.IntegerField()

class CustomerDetails(models.Model):
    ADDRESS_TYPE = (
        ('home','Home'),
        ('office','Office'),
        ('other','Other')
    )
    
    uid = models.ForeignKey(User, on_delete = models.CASCADE, db_column="uid")
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    phone = models.CharField(max_length=50)
    email = models.EmailField(max_length=50)
    address_type = models.CharField(max_length=10,choices=ADDRESS_TYPE)
    full_address = models.CharField(max_length=200)
    pincode = models.CharField(max_length=10)

class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()

    def __str__(self):
        return self.name