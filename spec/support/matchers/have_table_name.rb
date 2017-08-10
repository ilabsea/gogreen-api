# Usage:
#
#   it { is_expected.to have_table_name 'table_names' }
#

module HaveTableNameMatcher
  def have_table_name(table_name)
    HaveTableNameMatcher.new(table_name)
  end

  class HaveTableNameMatcher
    def initialize(table_name)
      @table_name = table_name
    end

    def matches?(subject)
      @actual_table_name = subject.class.table_name
      @actual_table_name == @table_name
    end

    def description
      "have table name '#{@table_name}'"
    end

    def failure_message
      "Expected to have table name :#{@table_name} but got :#{@actual_table_name}"
    end

    def failure_message_when_negated
      "Didn't expect to have table name :#{@table_name} but got :#{@table_name}"
    end
  end
end
