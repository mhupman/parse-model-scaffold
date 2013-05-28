require 'spec_helper'
require 'json'

describe Parse::Model::Scaffold::ParseApi do

    subject { Parse::Model::Scaffold::ParseApi.new 'my_app_id', 'my_api_key' }

    it 'should exist after creation' do
        subject.should_not be_nil
    end

    it 'should use custom http headers' do
        subject.options.has_key?(:headers).should be_true
    end

    it 'should use app_id as an HTTP header' do
        subject.options[:headers].has_key?('X-Parse-Application-Id').should be_true
        subject.options[:headers]['X-Parse-Application-Id'].should eql('my_app_id')
    end

    it 'should use api_key as an HTTP header' do
        subject.options[:headers].has_key?('X-Parse-REST-API-Key').should be_true
        subject.options[:headers]['X-Parse-REST-API-Key'].should eql('my_api_key')
    end

    it 'should return a single object from get_first' do

        stub_request(:get, "https://api.parse.com/1/classes/testclass?limit=1")
            .to_return(
                :body => JSON.generate(
                    { :results => [{:name => 'mr. ding'}] }
                ),
                :headers => {'Content-Type' => 'application/json'}
            )

        obj = subject.get_first 'testclass'

        obj.nil?.should be_false
        obj.has_key?('name').should be_true
        obj['name'].should eql('mr. ding')
    end
end