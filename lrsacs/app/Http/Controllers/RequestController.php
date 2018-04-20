<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;


class RequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $requests = DB::select('select * from request');
         return $requests;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $users = DB::select('select * from user');
        $items = DB::select('select * from item');
        return view('request.requestCreate')->with('users',$users)->with('items',$items);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   

        // even after 2.7 hours of head scratching, I couldn't figure out why this code doesn't work. 
        // DB::insert('insert into request (source_user_id,destination_user_id,status,RequestedItemCount, ItemsProvidedCount, Item_id) values
        //     (source_user_id=:source_user_id,destination_user_id=:destination_user_id,status=:status,RequestedItemCount=:RequestedItemCount, ItemsProvidedCount=:ItemsProvidedCount, Item_id=:Item_id)',[
        //             "source_user_id"=>$request->source_user_id,
        //             "destination_user_id"=>$request->destination_user_id,
        //             "status"=>$request->status,
        //             "RequestedItemCount"=>$request->RequestedItemCount,
        //             "ItemsProvidedCount"=>$request->ItemsProvidedCount,
        //             "Item_id"=>$request->Item_id
        // ]);

        // This works like a charm, pardon me for not using named variables
        DB::insert('insert into request(source_user_id,destination_user_id,status,RequestedItemCount, ItemsProvidedCount, Item_id) values(?,?,?,?,?,?)',[
            $request->source_user_id,
            $request->destination_user_id,
            $request->status,
            $request->RequestedItemCount,
            $request->ItemsProvidedCount,
            $request->Item_id]);

        return "inserted record(s).";

        // return $request->all();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
