<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PenilaianKerja extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $primaryKey = 'penilaiankerja_id';

    public function pegawai(): BelongsTo
    {
        return $this->belongsTo(Pegawai::class, 'pegawai_id', 'pegawai_id');
    }

    public function penilai(): BelongsTo
    {
        return $this->belongsTo(Pegawai::class, 'penilai_id', 'pegawai_id');
    }
}
