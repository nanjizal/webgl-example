package webglExample.geometry;
import webglExample.geometry.*;
@:structInit
class Geometry_ {
    public var faces: Array<Face>;
    public function new( faces: Array<Face> ){
        this.faces = faces;
    }
}
abstract Geometry( Geometry_ ) from Geometry_ to Geometry_ {
    public inline function new( faces: Array<Face> ){
        this = new Geometry_( faces );
    }
    public inline
    function vertexCount(){
        return this.faces.length * 3;
    }
    public inline
    function positions(){
        var answer = new Array<Float>();
        var positionExtract = function( answer: Array<Float>, vertex: Vertex ){
            var v = vertex.position;
            answer.push( v.x );
            answer.push( v.y );
            answer.push( v.z );
            return answer;
        }
        extract( answer, positionExtract );
        return answer;
    }
    public inline
    function normals(){
        var answer = new Array<Float>();
        var normalExtract = function( answer: Array<Float>, vertex: Vertex ){
            var v = vertex.normal;
            answer.push( v.x );
            answer.push( v.y );
            answer.push( v.z );
            return answer;
        }
        extract( answer, normalExtract );
        return answer;
    }
    public inline
    function uvs(){
        var answer = new Array<Float>();
        var uvExtract = function( answer: Array<Float>, vertex: Vertex ){
            var v = vertex.uv;
            answer.push( v.x );
            answer.push( 1 - v.y );
            return answer;
        }
        extract( answer, uvExtract );
        return answer;
    }
    public inline
    function extract( answer: Array<Float>
                    , f: ( answer: Array<Float>, vertex: Vertex ) -> Array<Float> 
                    ){
        var len = this.faces.length;
        var vlen: Int;
        var face: Face;
        var vertex: Vertex;
        var v: Vector2;
        for( i in 0...len ){
            face = this.faces[ i ];
            vlen = face.vertices.length;
            for( j in 0...vlen ){
                vertex = face.vertices[ j ];
                f( answer, vertex );
            }
        }
        return answer;
    }
}