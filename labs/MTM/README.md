Architectural patterns like MVC, MVVM, MVP and similar are widely known and
used. While I reviewed them through the philosophical lenses, some interesting
questions had happened.

For example, what is V (View) physically? In web application this is mostly a DOM.
What is DOM? This is Document Object Model. If I develop WebGL application?
Scene model that contains 3D and other models for Three.js. Android? Object
models based on ViewGroup, View and other components. Usually it's defined in
XML and looks very close to how DOM is defined using HTML. I'll find similar
models everywhere, from ancient Turbo Vision or VCL to modern WPF, UIKit, etc.

And I can explaing this with easy. Developers of user interfaces don't work on
a low level, drawing pixel by pixel. Instead geometry models are defined, for
instace - line (Xstart, Ystart, Xend, Yend). Then, geometry objects are grouped
into UI models like buttons, dropdowns, etc.

C (Controller) simply connects user input with models and views.

VM (View model) is usually an abstraction of user interface to avoid
platform-specific details. And it is a bridge between View and Model, utilizing
binding for event-driven communication that results in having hidden Controller
inside. So instead of MVVM I have a MV(MVC) that is a good attempt, but
overcomplicates things.

Besides these concepts there are also a lot of intermediate models like DTO,
Virtual DOM, JSON and others those involves a lot of processing between each
other.

What conclusion can I made from this panorama? Models is everywhere. Base on
typical web application, I receive user input as event model, convert it into
JSON request model, send it to REST API where it is converted from JSON back to
object model, apply some processing, send in a form of entity model to database,
deserialize back into some DTO model, convert to JSON before sending REST
response, decode into ES object, bind to DOM entity.

So basically I have models and processing pipeline from one model to another.
Nothing special like View-model or Presenter or Controller exists here. The
concept is extremely laconic and damned easy to write tests. It would be
interesting to develop and idea of a new model-to-model (M2M, MTM) paradigm.
