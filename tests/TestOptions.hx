package ;

import haxe.ds.StringMap;
using Lambda;

@:tink private class Dummy {
  public function new(foo = [7], o1 = { x: 5, y: 'bar'}, o2 = { a: o1.x, b: foo[0]}) {
    function test(foo = [7], o1 = { x: 5, y: 'bar'}, o2 = { a: o1.x, b: foo[0]}) {}
  }
  
  public function normal(foo = [7], o1 = { x: 5, y: 'bar'}, o2 = { a: o1.x, b: foo[0]}) 
    return { o1: o1, o2: o2 };
  
  public function direct(_ = { x: 5, y: 'bar'}, o3 = { x: 4 }) 
    return { x: x, y: y };
  
}

class TestOptions extends Base {
  function test() {
    
    var d = new Dummy();
    for (i in 0...10) {
      var r = d.normal({x:i});
      
      assertEquals(r.o1.x, r.o2.a);
    }
    var r = d.normal();
    assertEquals(5, r.o1.x);
    assertEquals('bar', r.o1.y);
    assertEquals(5, r.o2.a);
    assertEquals(7, r.o2.b);
    
    var r = d.direct();
    assertEquals(5, r.x);
    assertEquals('bar', r.y);
  }
}