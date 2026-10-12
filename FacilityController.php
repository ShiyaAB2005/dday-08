<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Facility;

class FacilityController extends Controller
{
    public function index()
    {
        return response()->json(Facility::all());
    }

    public function store(Request $request)
    {
        $facility = Facility::create(
            $request->validate([
                'name' => 'required|string|max:100',
                'location' => 'nullable|string|max:150'
            ])
        );

        return response()->json($facility, 201);
    }

    public function show($id)
    {
        return response()->json(Facility::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $facility = Facility::findOrFail($id);

        $facility->update(
            $request->validate([
                'name' => 'sometimes|required|string|max:100',
                'location' => 'nullable|string|max:150'
            ])
        );

        return response()->json($facility);
    }

    public function destroy($id)
    {
        $facility = Facility::findOrFail($id);
        $facility->delete();

        return response()->json([
            'message' => 'Facility deleted successfully'
        ]);
    }
}