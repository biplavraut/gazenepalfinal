<pre> 
<?php // var_dump($blog_list);
?><ul>
@foreach($blog_list as $blog)
<li>{{ $blog->slug }} 
</li>
@endforeach
</ul>

<ul>
@foreach($slider_list as $slider)
<li> {{ $slider->title }}</li>
@endforeach
</ul>