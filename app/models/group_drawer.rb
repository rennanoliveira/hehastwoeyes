class GroupDrawer

  def initialize(group, draw_generator = SecretSantaMaker)
    @group = group
    @draw_generator = draw_generator
  end

  def draw
    pairs = generate_pairs
    ActiveRecord::Base.transaction do
      pairs.each do |pair|
        @group.secret_santas.build(participant: pair[0], friend: pair[1])
      end
      @group.drawn = true
      @group.save
    end
  end

  private

  def generate_pairs
    @draw_generator.new(@group.participants).generate
  end

end