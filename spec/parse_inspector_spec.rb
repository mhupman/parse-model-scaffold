require 'spec_helper'

describe Parse::Model::Scaffold::ParseInspector do

	it 'should ignore protected Parse fields' do

		obj = {
			'ACL' => {},
			'createdAt' => {},
			'updatedAt' => {},
			'objectId' => {}
		}

		attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

		attrs.length.should equal(0)
	end

	describe 'parsing native ruby types' do

		it 'should identify strings' do

			obj = { 'name' => 'testname'}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:String)
		end

		it 'should identify booleans' do

			obj = { 'active' => false}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Boolean)
		end

		it 'should identify numbers' do

			obj = { 'age' => 23}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Fixnum)
		end

		it 'should identify arrays' do

			obj = { 'favorites' => [1,2,3]}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Array)
		end

		it 'should identify objects' do

			obj = { 'attributes' => {}}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Hash)
		end
	end

	describe 'parsing Parse attribute types' do

		it 'should identify PFObject pointers' do
			obj = {
				"photo" => {
			        "__type" => "Pointer",
			        "className" => "Photo",
			        "objectId" => "xxxxxxxx"
			    }
			}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Pointer)
		end

		it 'should identify PFRelations' do
			obj = {
				"categories" => {
			        "__type" => "Relation",
			        "className" => "Category"
			    }
			}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:Relation)
		end

		it 'should identify PFGeoPoints' do
			obj = {
				"categories" => {
			        "__type" => "GeoPoint",
			        "latitude" => 38.80523194147864,
        			"longitude" => -77.04765558242798
			    }
			}

			attrs = Parse::Model::Scaffold::ParseInspector.parse(obj)

			attrs.length.should equal(1)
			attrs[0].type.should eql(:GeoPoint)
		end
	end
end