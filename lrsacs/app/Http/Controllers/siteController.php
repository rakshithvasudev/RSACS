<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class siteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sites = DB::select('select * from site');

        return $sites;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      return view('site.site');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::insert('insert into site (shortName,addressLine1,addressLine2,city,state,zipcode,phoneNumber) values (:shortName,:addressLine1,:addressLine2,:city,:state,:zipcode,:phoneNumber)', 
            ['shortName' => $request->shortName,
             'addressLine1' => $request->addressLine1,
             'addressLine2'=>$request->addressLine2,
             'city'=>$request->city,
             'state' =>$request->state,
             'zipcode'=>$request->zipcode,
             'phoneNumber'=>$request->phoneNumber]);
        
        return "Added record to db!";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    
        $results = DB::select('select * from site where site_id = :site_id limt 1', ['site_id' => $id]);
        return $results;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $foundSite = DB::select('select * from site where site_id =:site_id limit 1',['site_id'=>$id]);
         return view('site.siteEdit')->with('foundSite',$foundSite);
         // return gettype ($foundSite);
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
