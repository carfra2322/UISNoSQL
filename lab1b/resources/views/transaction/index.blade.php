<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CSC561 | Lab1c</title>
  </head>
<body>



<h3>inventory items that user1 has checked out - (User -> { hasMany } -> Transactions -> {belongs} -> Inventory )</h3>
<table border="1">
				<thead>
                    
                    <th>Item description</th>
                    <th>Checked Out</th>

				</thead>

				<tbody>
					@foreach ($users -> where('id',1) -> first() -> transaction as $transaction_for_user1)
                    <tr>
                      <td>{{$transaction_for_user1-> inventory -> description}}</td>
                      <td>{{$transaction_for_user1-> checkout_time}}</td>              
                    </tr>
                     @endforeach

                </tbody>
</table>

<h3>users who checked out items before September 3 2018</h3>
<table border="1">
				<thead>
                    
                    <th>First Name</th>
                    <th>Item Description</th>
                    <th>Checkout time</th>
                    <th>status</th>

				</thead>

				<tbody>
					@foreach ($filteredTransactions as $my_transactions)
          
                    <tr>
                      <td>{{$users -> find($my_transactions -> user_id) -> first_name }}</td>
                      <td>{{$inventories -> find($my_transactions -> inventory_id) -> description }}</td>
                      <td>{{$my_transactions-> checkout_time }}</td>
                      <td>{{$statuses -> find($inventories -> find($my_transactions -> inventory_id) -> status_id) -> description }}</td>

             
                    </tr>
                     @endforeach

                </tbody>
</table>



</body>
</html>
