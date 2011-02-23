=begin
  ASF-REST-Adapter
  Copyright 2010 Raymond Gao @ http://are4.us

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
=end
require File.dirname(__FILE__) + '/salesforce/rest/asf_rest_error.rb'
require File.dirname(__FILE__) + '/salesforce/rest/asf_connection.rb'
require File.dirname(__FILE__) + '/salesforce/rest/asf_rest.rb'

#Now common objects
require File.dirname(__FILE__) + '/salesforce/rest/classes/apex_log.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/account.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/account_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/asset.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/asset_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/campaign.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/campaign_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/case.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/case_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/case_team_member.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/contact.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/contact_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/contract.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/contract_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/entity_subscription.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/feed_comment.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/feed_post.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/feed_tracked_change.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/group.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/group_member.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/lead.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/lead_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/news_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/opportunity.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/opportunity_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/organization.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/product2.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/product2_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/solution.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/solution_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/solution_history.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/task.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/task_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/user.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/user_feed.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/user_role.rb'
require File.dirname(__FILE__) + '/salesforce/rest/classes/user_profile_feed.rb'


# Initialize the adapter, the 1st step of using the adapter. A good place to invoke
# it includes 'setup()' method in the 'test_helper' and Rails init file.
# TODO, to be removed in the 1.0 version
def initalize_adapter()
  require 'asf-soap-adapter'
  p "*" * 80
  p 'Set up code'
  @u = Salesforce::User.first
  @version = "v" + @u.connection.config[:api_version].to_s
  puts "Sf User name is: " + @u.name

  @oauth_token = @u.connection.binding.instance_variable_get("@session_id")
  puts "oauth token is: " + @oauth_token

  @soap_url = @u.connection.binding.instance_variable_get("@server").address
  @rest_svr_url = @soap_url.gsub(/-api\S*/mi, "") + ".salesforce.com"
  puts 'rest_svr_url' + @rest_svr_url

  Salesforce::Rest::AsfRest.setup(@oauth_token, @rest_svr_url, @version)
end

#initalize_adapter()
