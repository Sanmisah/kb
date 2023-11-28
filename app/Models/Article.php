<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Section;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Article extends Model implements HasMedia
{
    use HasFactory, CreatedUpdatedBy, InteractsWithMedia;
    protected $fillable = [
        'topic',
        'description',
        'section_id',
    ];

    public function Section() 
    {
        return $this->belongsTo(Section::class);
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('topic', 'like', '%'.$search.'%')
                      ->orWhereRelation('Section', 'section_name', 'like', '%'.$search.'%');
            });
        });
    }
}
