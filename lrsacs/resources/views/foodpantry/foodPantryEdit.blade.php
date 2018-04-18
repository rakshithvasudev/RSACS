 <main>
    <div>
        <h1>Edit the FoodPantry</h1>
	    <form method="post" action="/foodpantry/{{$foodpantry[0]->sFoodPantry_id}}">
      <input type="hidden" name="_method" value="PUT">
	    <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="form-group">   
             

            <label for="Services">Services</label><br>
             <select name="service_id">
              @foreach($services as $service)
               <option value="{{$service->service_id}}">{{$service->sName}}</option>
              @endforeach
             </select>
             <br>



             <label for="description">Food Pantry Description</label><br>
             <textarea class="form-control" name="description" rows=5>{{$foodpantry[0]->description}}</textarea> <br>


              <button type="submit" class="btn btn-primary">Submit</button>
          </div>                                                            
        </form>
    </div>
</main>