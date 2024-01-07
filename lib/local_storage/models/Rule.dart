
class Rule{

  final RulePriority priority;
  final String name;
  final String? description;

  Rule(this.priority, this.name, this.description);

  @override
  String toString() {
    return 'Rule{priority: $priority, name: $name, description: $description}';
  }

}

enum RulePriority{
  high, medium, low
}
