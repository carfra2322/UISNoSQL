<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    protected $table = 'inventory';

    public function transactions()
    {
        return $this->belongsToMany('App\Transaction');
    }

    public function status()
    {
        return $this->belongsTo('App\Status');
    }
}
