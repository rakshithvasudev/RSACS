 <main>
    <div>
        <h1>Create a new Shelter</h1>
	    <form method="post" action="/shelter">
	    <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="form-group">   
             <label for="hoursOfOperation">Hours of Operation</label>
              <input type="text" class="form-control"  placeholder="default: 7PM to 7AM"  name="hoursOfOperation"><br>
              
              <label for="bunkType">Bunk Type:</label>
              <input type="text" class="form-control"  placeholder="2 letters - MM" name="bunkType"><br>

              <label for="bunkCount">Bunk Available Count:</label>
              <input type="text" class="form-control"  placeholder="ex: 20" name="bunkCount"><br>

              <label for="familyRoomAvailableCount">Family Room Available Count:</label>
              <input type="text" class="form-control"  placeholder="ex: 2" name="familyRoomAvailableCount"><br>

              <label for="service">Choose your service:</label>             
              <select name="service_id">
                @foreach ($services as $service)
                  <option value="{{$service->service_id}}">{{$service->sName}}</option>  
                @endforeach
              </select><br>

              <label for="description">Bunk Description:</label>
              <textarea class="form-control"  placeholder="Describe your bunk here" name="description" rows=5></textarea> 

              <button type="submit" class="btn btn-primary">Submit</button>
          </div>                                                            
        </form>
    </div>
</main>
