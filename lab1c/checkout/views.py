from django.shortcuts import render
from django.http import HttpResponse
from django.http import Http404

from .models import User
from .models import Transaction


# in the project, we would want User.objects.get(1)
# for transactions: Transaction.objects.filter(checkout_time__lte=2018-09-03)
def home(request):
    user =  User.objects.get(id=1)
    #transactions = Transaction.objects.all()
    transactions = Transaction.objects.filter(checkout_time__lte="2018-09-03 00:00:00")
    return render(request, 'home.html', {'user': user, 'transactions': transactions})
