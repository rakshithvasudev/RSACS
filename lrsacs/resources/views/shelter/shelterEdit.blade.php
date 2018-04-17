 <main>
    <div>
        <h1>Edit the Shelter</h1>
	    <form method="post" action="/shelter">
	    <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="form-group">   
             <label for="hoursOfOperation">Hours of Operation</label>
              <input type="text" class="form-control"   name="hoursOfOperation" value="{{$shelter[0]->hoursOfOperation}}"><br>
              
              <label for="bunkType">Bunk Type:</label>
              <input type="text" class="form-control"  name="bunkType"  value="{{$shelter[0]->bunkType}}"><br>

              <label for="bunkAvailableCount">Bunk Available Count:</label>
              <input type="number" class="form-control" name="bunkAvailableCount"  value="{{$shelter[0]->bunkAvailableCount}}"><br>

              <label for="familyRoomAvailableCount">Family Room Available Count:</label>
              <input type="number" class="form-control" name="familyRoomAvailableCount"  value="{{$shelter[0]->familyRoomAvailableCount}}"><br>

              <label for="service">Choose your service:</label>             
              <select name="service_id">
                @foreach ($services as $service)
                  <option value="{{$service->service_id}}" >{{$service->sName}}</option>  
                @endforeach
              </select><br>

              <label for="description">Bunk Description:</label>
              <textarea class="form-control"  name="description" rows=5 >{{$shelter[0]->description}}</textarea> 

              <button type="submit" class="btn btn-primary">Submit</button>
          </div>                                                            
        </form>
    </div>
</main>
