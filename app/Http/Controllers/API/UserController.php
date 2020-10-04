<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$this->authorize('isAdmin');
            // The current user can update the post...
        if ( \Gate::allows('isSupAdmin')|| \Gate::allows('isAdmin')) {
            return User::wherein('type', array('admin', 'supadmin', 'editor', 'user'))->latest()->paginate(10);
        }elseif (\Gate::allows('isSupDev') || \Gate::allows('isDev')){
            return User::wherein('type', array('dev','admin', 'supadmin', 'editor', 'user'))->latest()->paginate(10);
        }else{
            return "access-denied";
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (\Gate::allows('isSupDev') || \Gate::allows('isDev')|| \Gate::allows('isSupAdmin')|| \Gate::allows('isAdmin')) {
            $this->validate($request, [
                'name' => 'required|string|max:191',
                'email' => 'required|string|email|max:191|unique:users',
                'password' => 'required|string|min:6'
            ]);
            try {
                $slug = $this->createSlug($request->name, '');
            } catch (Exception $e) {
                //report($e);
                return $e;
            }
            return User::create([
                'name' => $request['name'],
                'slug' => $slug,
                'email' => $request['email'],
                'type' => $request['type'],
                'bio' => $request['bio'],
                'photo' => $request['photo'],
                'password' => Hash::make($request['password']),
            ]);
        }else{
            return "access-denied";
        }
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
    //update password
    public function updatePassword(Request $request)
    {
        $user =  auth('api')->user();

        $this->validate($request,[
            'oldpassword' => 'required|min:6',
            'newpassword' => 'required|min:6'
        ]);
        $pass = User::select('password')->where('id', '=', $request->id)->first();
        //return $pass->password .' gg '. Hash::make($request->oldpassword);
        if(password_verify($request->oldpassword, $pass->password)){
            if(!empty($request->newpassword)){
                $request->merge(['newpassword' => Hash::make($request['newpassword'])]);
            }
            User::where('id', '=', $request->id)->update(['password'=> $request->newpassword]);
            return['message'=>'success'];
        }
        else{
            return['message ' => 'password doesnt match'];
        }


    }
    //Show user profile
    public function updateProfile(Request $request)
    {
        if (\Gate::allows('isSupDev') || \Gate::allows('isDev')|| \Gate::allows('isSupAdmin')|| \Gate::allows('isAdmin')) {
            $user = auth('api')->user();
            $this->validate($request, [
                'name' => 'required|string|max:191',
                'email' => 'required|string|email|max:191|unique:users,email,' . $user->id,
                'password' => 'sometimes|required|min:6',
            ]);

            /*Upload the image in server*/
            $currentPhoto = $user->photo;
            $slug = Str::slug($request->name);

            if ($request->slug != $slug) {
                $request->merge(['slug' => $this->createSlug($request->name, $request->id)]);
            }
            $imageName = $request->slug;

            if ($request->photo != $currentPhoto) {
                $name = $imageName . '.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
                \Image::make($request->photo)->save(public_path('img/profile/') . $name);
                \File::makeDirectory('img/profile/thumbs', $mode = 0777, true, true);//making directory
                \Image::make($request->photo)->resize(100, 100)->save(public_path('img/profile/thumbs/') . $name);//resize image

                //$request->photo = $name;
                $request->merge(['photo' => $name]);

                /*Start Delete previous photo in Directory*/
                $userPhoto = public_path('img/profile/') . $currentPhoto;
                if (file_exists($currentPhoto)) {
                    @unlink($currentPhoto);
                }
                /*End of Delete previous photo in Directory*/

            }

            /*If user change the password*/
            if (!empty($request->newpassword)) {
                $request->merge(['newpassword' => Hash::make($request['newpassword'])]);
            }
            $user->update($request->all());
            return ['message' => 'success'];
        }
    }
    //Show user profile
    public function profile()
    {
        return auth('api')->user();
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
        $user = User::findOrFail($id);

        $this->validate($request,[
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6'
        ]);
        /*If user change the password*/
        if(!empty($request->password)){
            $request->merge(['password' => Hash::make($request['password'])]);
        }
        $slug = Str::slug($request->name);

        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->name, $request->id)]);
        }
        //return $request->slug;
        $user->update($request->all());
        return ['message'=>'User Info Updated'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdmin');

        $user = User::findOrFail($id);

        //delete the user
        $user->delete();

        return ['message' =>'User Deleted'];
    }
    public function search(){

        if($search = \Request::get('q')){
            $users = User::where(function($query) use($search){
                $query->where('name','LIKE',"%$search%")
                    ->orWhere('email','LIKE',"%$search%")
                    ->orWhere('type','LIKE',"%$search%");
            })->paginate(10);
        }else{
            $users = User::latest()->paginate(10);

        }
        return $users;

    }
    /*Generating Unique Slug*/
    public function createSlug($title, $id)
    {
        if(!($id)):
            $id = 0;
        endif;
        // Normalize the title
        $slug = Str::slug($title);

        // Get any that could possibly be related.
        // This cuts the queries down by doing it once.
        $allSlugs = $this->getRelatedSlugs($slug, $id);
        /*$allSlugs = User::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();*/

        // If we haven't used it before then we are all good.
        if (! $allSlugs->contains('slug', $slug)){
            return $slug;
        }

        // Just append numbers like a savage until we find not used.
        for ($i = 1; $i <= 100; $i++) {
            $newSlug = $slug.'-'.$i;
            if (! $allSlugs->contains('slug', $newSlug)) {
                return $newSlug;
            }
        }

        throw new \Exception('Can not create a unique slug- Many Users of same Name');
    }

    protected function getRelatedSlugs($slug, $id = 0)
    {
        return User::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/


}
