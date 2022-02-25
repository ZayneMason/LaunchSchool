# https://launchschool.com/exercises/8621919c

birds = ['raven', 'finch', 'hawk', 'eagle']

def bird_types(birds)
  yield(birds)
end

bird_types(birds) {|_,_, *raptors| puts raptors}