from django.shortcuts import render, HttpResponse, redirect
from .models import Products, Cart, CustomerDetails
from django.db.models import Q
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
import razorpay

# Create your views here.
def testing(request):
    msg = "Hiii this is working"
    return HttpResponse(msg)

# def home(request):
#     return render(request,'products/home.html')

def home(request):
    data = {}
    # modelname.objects.all() is used to fetch all data possible
    fetched_porducts = Products.objects.filter(is_active=True)
    data['products'] = fetched_porducts
    return render(request,'products/home.html', context=data)

def store(request):
    data = {}

    fetched_porducts = Products.objects.filter(is_active=True)
    data['products'] = fetched_porducts
    user_id = request.user.id
    id_specific_cart_items = Cart.objects.filter(uid=user_id)
    count = id_specific_cart_items.count()
    data['cart_count'] = count

    user_id = request.user.id
    id_specific_cart_items = Cart.objects.filter(uid=user_id)
    total_quantity = 0
    for item in id_specific_cart_items:
        total_quantity += item.quantity
    data['cart_count'] = total_quantity
    return render(request,'products/store.html', context=data)

def filter_by_category(request, category_value):
    data = {}
    q1 = Q(is_active = True)
    q2 = Q(category = category_value)
    Products.objects.filter(q1 & q2)
    filtered_products = Products.objects.filter(q1 & q2)
    data['products'] =  filtered_products
    return render(request,'products/store.html', context=data)

def sort_by_brand(request, brand_name):
    data = {}
    q1 = Q(is_active = True)
    q2 = Q(brand = brand_name)
    Products.objects.filter(q1&q2)
    sorted_products = Products.objects.filter(q1&q2)
    data['products'] = sorted_products
    return render(request,'products/store.html', context=data)

def filter_by_price(request):
    data = {}
    min_value = request.GET['min']
    max_value = request.GET['max']
    q1 = Q(is_active = True)
    q2 = Q(price__gte = min_value)
    q3 = Q(price__lte = max_value)
    filtered_products = Products.objects.filter(q1 & q2 & q3)
    data['products'] = filtered_products
    return render(request, 'products/store.html', context=data)

def sort_by_rating(request, rating_value):
    data = {}
    q1 = Q(is_active=True)
    q3 = Q(rating__gt=rating_value)
    rating_product = Products.objects.filter(q1 & q3)
    data['products']=rating_product
    print(rating_product)
    return render(request,'products/store.html', context=data)

def register_user(request):
    data = {}
    if request.method == "POST":
        uname = request.POST['username']
        upass = request.POST['password']
        uconf_pass = request.POST['password2']

        if(uname == '' or upass == '' or uconf_pass == ''):
            data['error_msg']='Fields cannot be empty'
            return render(request,'users/register.html',context=data)
        
        elif(upass!=uconf_pass):
            data['error_msg']='Password does not match'
            return render(request,'users/register.html',context=data)
        
        elif(User.objects.filter(username=uname).exists()):
            data['error_msg']= 'Username, '+uname+' already exists!'
            return render(request,'users/register.html',context=data)
        
        else:
            user = User.objects.create(username=uname)
            user.set_password(upass)
            user.save()
            customer = CustomerDetails.objects.create(uid=user)
            customer.save()
            return redirect("/users/login")
    return render(request,'users/register.html')

def login_user(request):
    data = {}
    if request.method=="POST":
        uname = request.POST['username']
        upass = request.POST['password']
        
        #implementing validation
        if(uname=='' or upass==''):
            data['error_msg']='Fields cant be empty'
            return render(request,'users/login.html',context=data)
        
        elif(not User.objects.filter(username=uname).exists()):
            data['error_msg']=uname+' user is not registered'
            return render(request,'users/login.html',context=data)
        
        else:
            user = authenticate(username=uname, password=upass)
            print(user)
            if user is not None:
                login(request,user)
                return redirect('/products/store')
            else:
                data['error_msg']='Wrong Password'
                return render(request,'users/login.html',context=data)
    return render(request,'users/login.html')

def user_logout(request):
    logout(request)
    return render(request,'products/home.html',{'user_data':"User"})

def add_to_cart(request,pid):
    if request.user.is_authenticated:
        uid = request.user.id
        print("user id=", uid)
        print("product id=", pid)
        user = User.objects.get(id = uid)
        product = Products.objects.get(id = pid)
        q1 = Q(uid = uid)
        q2 = Q(pid = pid)
        available_products = Cart.objects.filter(q1 & q2)
        print()
        if(available_products.count()>0):
            messages.error(request, 'Product is already added to cart!')
            return redirect('/products/store')
        else:
            cart = Cart.objects.create(pid=product, uid=user)
            cart.save()

            messages.success(request, "Product added to the cart!")
            return redirect('/products/store')
    else:
        return redirect("/users/login")
    
def view_cart(request):
    if request.user.is_authenticated:
        data = {}
        user_id = request.user.id
        id_specific_cart_items = Cart.objects.filter(uid=user_id)
        data['products']=id_specific_cart_items
        total_price = 0
        total_quantity = 0
        for item in id_specific_cart_items:
            total_price+=item.pid.price*item.quantity
            total_quantity += item.quantity
        data['total_price']=total_price
        data['cart_count'] = total_quantity

        return render(request,'products/cart.html', context=data)
    else:
        return redirect("/users/login")
    
def remove_item(request,cid):
    cart_item = Cart.objects.get(id=cid)
    print(cart_item)
    print(type(cart_item))
    cart_item.delete()
    return redirect("/products/cart/")

def update_quantity(request,flag,cartid):
    cart = Cart.objects.filter(id=cartid)
    actual_quantiy = cart[0].quantity
    if(flag=="1"):
        cart.update(quantity = actual_quantiy+1)
        return redirect("/products/cart/")
    else:
        if(actual_quantiy-1==0):
            remove_item(request,cartid)
            return redirect("/products/cart/")
        else:
            cart.update(quantity = actual_quantiy-1)
            return redirect("/products/cart/")
        
def order(request):
    data = {}
    user_id = request.user.id
    user = User.objects.get(id=user_id)
    
    id_specific_cart_items = Cart.objects.filter(uid=user_id)

    customer = CustomerDetails.objects.get(uid=user_id)
    data['customer']=customer
    data['products']=id_specific_cart_items
    data['user']=user
    total_price = 0
    total_quantity = 0
    
    for item in id_specific_cart_items:
        total_price = (total_price)+(item.pid.price*item.quantity)
        total_quantity += item.quantity
    data['total_price']=total_price
    data['cart_count'] = total_quantity
    return render(request,'products/orders.html',context=data)

def profile(request):
    data={}
    user_id=request.user.id
    customer_querySet=CustomerDetails.objects.filter(uid=user_id)
    customer_detail = customer_querySet[0]
    data['customer']=customer_detail
    if request.method=="POST":
        first_name=request.POST['fname']
        last_name=request.POST['lname']
        phone=request.POST['phone']
        email=request.POST['email']
        address_type=request.POST['address_type']
        full_address=request.POST['full_address']
        pincode=request.POST['pincode']
        print(first_name,last_name,phone,email,address_type,full_address,pincode)
        customer_querySet.update(first_name=first_name,last_name=last_name,phone=phone,email=email,address_type=address_type,full_address=full_address,pincode=pincode)
        return redirect('/products/store')
    return render(request,'users/my_account.html',context=data)

def payment(request):
    user_id=request.user.id
    id_specific_cart_items = Cart.objects.filter(uid=user_id)
    total_price = 0

    for item in id_specific_cart_items:
        total_price = (total_price)+(item.pid.price*item.quantity)

    client = razorpay.Client(auth=("rzp_test_v1gUjPoLcuofls", "E4H03VOIVK2yoZIZxQSkncKf"))

    data = { "amount": total_price*100, "currency": "INR", "receipt": "order_rcptid_11" }
    payment = client.order.create(data=data)
    print(payment)

    cart = Cart.objects.filter(uid=user_id)
    cart.delete()
    return render(request,'products/pay.html',context=data)

from .models import Contact
def contact_form(request):
    return render(request, 'products/contact.html')

def contact_submit(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        message = request.POST.get('message')

        contact = Contact.objects.create(name=name, email=email, message=message)
        print(contact)
        return redirect('/products/home')
    return redirect('products:contact_submit')