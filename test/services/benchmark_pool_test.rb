require 'test_helper'

class BenchmarkPoolTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "#enqueue for ruby" do
    assert_enqueued_with(job: RemoteServerJob) do
      BenchmarkPool.enqueue('ruby', 'abc')
    end

    assert_enqueued_jobs 1
  end

  test "#enque for rails" do
    # ...
  end
end
