
class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def customers
    customers = []
    Meal.all.each do |meals|
      customers << meals.customer.name
    end
    customers
  end

  def most_frequent
    customers.max_by {|customer| customers.count(customer)}
  end

  def worst_tipped_meal
    worst_meal = meals.min do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    worst_meal
  end

  def self.least_experienced
    waiter = Waiter.all.min do |waiter_a, waiter_b|
      waiter_a.yrs_experience <=> waiter_b.yrs_experience
    end
    waiter
  end

end
