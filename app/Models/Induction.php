<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;

class Induction extends Model
{
    use HasFactory, CreatedUpdatedBy;
    protected $fillable = [
        'induction_name',
        'department_id'
    ];
    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('induction_name', 'like', '%'.$search.'%')
                      ->orWhereRelation('Department', 'department_name', 'like', '%'.$search.'%');
            });
        });
    }
    public function Department() 
    {
        return $this->belongsTo(Department::class, 'department_id');
    }
}
