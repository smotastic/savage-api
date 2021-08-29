enum Level { verbose, debug, info, warning, error, wtf, nothing }

extension LevelName on Level {
  String get name => toString().split('.').last;
}
