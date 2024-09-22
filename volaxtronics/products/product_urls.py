from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('test/', views.testing),
    path('home/', views.home),
    path('store/', views.store),
    path('filter/<str:category_value>', views.filter_by_category, name='filter_by_category'),
    path('sort/<str:brand_name>', views.sort_by_brand, name='sort_by_brand'),
    path('price', views.filter_by_price),
    path('rating/<int:rating_value>', views.sort_by_rating),
    path('add/<pid>', views.add_to_cart),
    path('cart/', views.view_cart),
    path('remove_item/<cid>', views.remove_item),
    path('update_quantity/<flag>/<cartid>', views.update_quantity),
    path('order/', views.order),
    path('payment/', views.payment),
    path('contact/', views.contact_form),
    path('contact/submit/', views.contact_submit,name='contact_submit'),
]
urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)