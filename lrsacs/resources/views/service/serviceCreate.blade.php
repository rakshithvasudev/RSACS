@extends('layouts.app')
@section('title', 'New Service')

@section('content')
 <main>
    <div>
        <h1>Create a new Service</h1>
	    <form method="post" action="/service">
	    <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="form-group">   
             <label for="sName">Service Name</label>
              <input type="text" class="form-control"  placeholder="Service Name"  name="sName"><br>
              
              <label for="Site ID"> Site ID:</label>
              <input type="text" class="form-control"  placeholder="Site ID" name="site_id"><br>

              <button type="submit" class="btn btn-primary">Submit</button>
          </div>                                                            
        </form>
    </div>
</main>
@endsection