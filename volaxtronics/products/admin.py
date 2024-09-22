from django.contrib import admin
from .models import Products, Cart, Order

# Register your models here.
class ProductAdmin(admin.ModelAdmin):
    list_display = ['id','name','price','details','brand','category','is_active','rating','image']

admin.site.register(Products, ProductAdmin)
admin.site.register(Cart)
admin.site.register(Order)