<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $table = 'transactions';

    public function users(){
        return $this->belongsTo('App\Users','user_id');
    }

    public function inventory()
    {
        return $this->belongsTo('App\Inventory');
    }
}
