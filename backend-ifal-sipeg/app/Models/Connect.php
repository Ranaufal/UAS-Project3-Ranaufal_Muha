<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Connect extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $primaryKey = 'connect_id';

    // Relasi ke user_id1
    public function user1(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id1', 'user_id');
    }

    // Relasi ke user_id2
    public function user2(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id2', 'user_id');
    }
}
