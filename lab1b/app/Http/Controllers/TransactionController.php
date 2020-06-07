<?php

namespace App\Http\Controllers;

use App\Transaction;
use App\Inventory;
use App\Status;
use App\Users;

use Illuminate\Http\Request;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    $inventories = Inventory::all();

    //dd($inventories);

    $statuses = Status::all();

    //dd($statuses);

    $users = Users::all();
    //dd($user);

    $transactions = Transaction::all();
    //dd($transactions);
    
  
    $filteredTransactions = $transactions -> where('checkout_time','<','2018-09-03 00:00:00');

    //$my_stuff = Transaction::find(3);
    //echo $my_stuff -> users -> first_name;

      



	return view('transaction.index')->with('inventories', $inventories)->with('statuses', $statuses)->with('transactions', $transactions)->with('users', $users)->with('filteredTransactions', $filteredTransactions);
    }

    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Transaction  $transaction
     * @return \Illuminate\Http\Response
     */
    public function show(Transaction $transaction)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Transaction  $transaction
     * @return \Illuminate\Http\Response
     */
    public function edit(Transaction $transaction)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Transaction  $transaction
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Transaction $transaction)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Transaction  $transaction
     * @return \Illuminate\Http\Response
     */
    public function destroy(Transaction $transaction)
    {
        //
    }
}
