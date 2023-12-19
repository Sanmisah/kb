<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;
use App\Models\Designation;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Notice extends Model implements HasMedia
{
    use HasFactory, CreatedUpdatedBy, InteractsWithMedia, LogsActivity;
    protected $fillable = [
        'sr_no',
        'notice_date',
        'notice',
        'department_id',
        'designation_id',
        'description'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['sr_no','notice_date','notice','department_id','designation_id','description']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public static function booted(): void
    {
        static::creating(function(Notice $notice){
            $notices = Notice::whereNotNull('sr_no')->orderBy('created_at','DESC')->first();
            $max = $notices ? Str::substr($notices->sr_no, 1) : 0;
            $notice->sr_no = 'N'.str_pad($max + 1, 5, "0", STR_PAD_LEFT);
        });
    }

    public function Department() 
    {
        return $this->belongsTo(Department::class);
    }

    public function Designation() 
    {
        return $this->belongsTo(Designation::class);
    }

    public function setNoticeDateAttribute($value)
    {
        $this->attributes['notice_date'] = $value != null  ? Carbon::createFromFormat('d/m/Y', $value) : null;
    }

    public function getNoticeDateAttribute($value)
    {
        return $value != null  ? Carbon::parse($value)->format('d/m/Y') : null;
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('sr_no', 'like', '%'.$search.'%')
                        ->orWhere('notice', 'like', '%'.$search.'%')
                        ->orWhere('department_id', 'like', '%'.$search.'%')
                        ->orWhere('designation_id', 'like', '%'.$search.'%')
                        ->orWhere('attachment', 'like', '%'.$search.'%');
            });
        });
    }
}
