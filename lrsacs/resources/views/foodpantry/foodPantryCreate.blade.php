 <main>
    <div>
        <h1>Create a new FoodPantry</h1>
	    <form method="post" action="/foodpantry">
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
             <textarea class="form-control"  placeholder="Describe your Food pantry here" name="description" rows=5></textarea> <br>


              <button type="submit" class="btn btn-primary">Submit</button>
          </div>                                                            
        </form>
    </div>
</main>
