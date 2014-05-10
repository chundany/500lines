require 'test/unit'
require_relative '../../models/trial'

class TrialTest < Test::Unit::TestCase

  def test_all
    trials = Trial.all
    assert (trials.count > 0)
    assert_equal [Trial], trials.map { |t| t.class }.uniq
  end

  def test_find
    trial = Trial.find('test/data/female-167-70_100-10-1-walk-g.txt')
    assert_equal File.read('test/data/female-167-70_100-10-1-walk-g.txt'), trial.parser.data

    assert_equal 'female', trial.user.gender
    assert_equal 167, trial.user.height
    assert_equal 70, trial.user.stride

    assert_equal 100, trial.device.rate
    assert_equal 10, trial.device.steps
    assert_equal '1', trial.device.trial
    assert_equal 'walk', trial.device.method
    
    assert_equal 8, trial.analyzer.steps
  end

  def test_create
    trial = Trial.create(
      'test/data/female-167-70_100-10-1-bagwalk-g.txt',
      {'gender' => 'female', 'height' => '157', 'stride' => '90'},
      { 'rate' => '100', 'steps' => '10', 'trial' => 'one', 'method' => 'run' }
    )
    
  end

end