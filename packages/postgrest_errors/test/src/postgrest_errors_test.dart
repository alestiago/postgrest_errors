import 'package:postgrest_errors/postgrest_errors.dart';
import 'package:test/test.dart';

void main() {
  group('PostgrestError', () {
    group('fromJson', () {
      test('returns a raw PostgresException when code is not found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': 'not_found',
            'message': 'message',
          },
        );
        expect(exception, isA<PostgrestException>());
      });

      test('returns a Postgrest000Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst000.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest000Exception>());
      });

      test('returns a Postgrest001Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst001.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest001Exception>());
      });

      test('returns a Postgrest002Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst002.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest002Exception>());
      });

      test('returns a Postgrest003Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst003.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest003Exception>());
      });

      test('returns a Postgrest100Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst100.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest100Exception>());
      });

      test('returns a Postgrest101Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst101.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest101Exception>());
      });

      test('returns a Postgrest102Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst102.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest102Exception>());
      });

      test('returns a Postgrest103Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst103.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest103Exception>());
      });

      test('returns a Postgrest105Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst105.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest105Exception>());
      });

      test('returns a Postgrest106Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst106.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest106Exception>());
      });

      test('returns a Postgrest107Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst107.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest107Exception>());
      });

      test('returns a Postgrest108Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst108.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest108Exception>());
      });

      test('returns a Postgrest109Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst109.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest109Exception>());
      });

      test('returns a Postgrest110Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst110.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest110Exception>());
      });

      test('returns a Postgrest111Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst111.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest111Exception>());
      });

      test('returns a Postgrest112Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst112.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest112Exception>());
      });

      test('returns a Postgrest113Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst113.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest113Exception>());
      });

      test('returns a Postgrest114Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst114.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest114Exception>());
      });

      test('returns a Postgrest115Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst115.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest115Exception>());
      });

      test('returns a Postgrest116Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst116.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest116Exception>());
      });

      test('returns a Postgrest117Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst117.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest117Exception>());
      });

      test('returns a Postgrest118Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst118.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest118Exception>());
      });

      test('returns a Postgrest119Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst119.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest119Exception>());
      });

      test('returns a Postgrest120Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst120.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest120Exception>());
      });

      test('returns a Postgrest200Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst200.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest200Exception>());
      });

      test('returns a Postgrest201Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst201.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest201Exception>());
      });

      test('returns a Postgrest202Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst202.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest202Exception>());
      });

      test('returns a Postgrest203Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst203.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest203Exception>());
      });

      test('returns a Postgrest204Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst204.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest204Exception>());
      });

      test('returns a Postgrest300Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst300.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest300Exception>());
      });

      test('returns a Postgrest301Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst301.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest301Exception>());
      });

      test('returns a Postgrest302Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrst302.code,
            'message': 'message',
          },
        );
        expect(exception, isA<Postgrest302Exception>());
      });

      test('returns a PostgrestX00Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {
            'code': PostgrestError.pgrstX00.code,
            'message': 'message',
          },
        );
        expect(exception, isA<PostgrestX00Exception>());
      });
    });
  });

  group('Postgrest000Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest000Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest000Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest000Exception(message: 'message');
      final code = PostgrestError.pgrst000.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest001Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest001Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest001Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest001Exception(message: 'message');
      final code = PostgrestError.pgrst001.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest002Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest002Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest002Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest002Exception(message: 'message');
      final code = PostgrestError.pgrst002.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest003Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest003Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest003Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest003Exception(message: 'message');
      final code = PostgrestError.pgrst003.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest100Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest100Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest100Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest100Exception(message: 'message');
      final code = PostgrestError.pgrst100.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest101Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest101Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest101Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest101Exception(message: 'message');
      final code = PostgrestError.pgrst101.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest102Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest102Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest102Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest102Exception(message: 'message');
      final code = PostgrestError.pgrst102.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest103Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest103Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest103Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest103Exception(message: 'message');
      final code = PostgrestError.pgrst103.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest105Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest105Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest105Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest105Exception(message: 'message');
      final code = PostgrestError.pgrst105.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest106Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest106Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest106Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest106Exception(message: 'message');
      final code = PostgrestError.pgrst106.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest107Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest107Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest107Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest107Exception(message: 'message');
      final code = PostgrestError.pgrst107.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest108Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest108Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest108Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest108Exception(message: 'message');
      final code = PostgrestError.pgrst108.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest109Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest109Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest109Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest109Exception(message: 'message');
      final code = PostgrestError.pgrst109.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest110Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest110Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest110Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest110Exception(message: 'message');
      final code = PostgrestError.pgrst110.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest111Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest111Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest111Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest111Exception(message: 'message');
      final code = PostgrestError.pgrst111.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest112Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest112Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest112Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest112Exception(message: 'message');
      final code = PostgrestError.pgrst112.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest113Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest113Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest113Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest113Exception(message: 'message');
      final code = PostgrestError.pgrst113.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest114Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest114Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest114Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest114Exception(message: 'message');
      final code = PostgrestError.pgrst114.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest115Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest115Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest115Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest115Exception(message: 'message');
      final code = PostgrestError.pgrst115.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest116Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest116Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest116Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest116Exception(message: 'message');
      final code = PostgrestError.pgrst116.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest117Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest117Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest117Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest117Exception(message: 'message');
      final code = PostgrestError.pgrst117.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest118Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest118Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest118Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest118Exception(message: 'message');
      final code = PostgrestError.pgrst118.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest119Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest119Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest119Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest119Exception(message: 'message');
      final code = PostgrestError.pgrst119.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest120Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest120Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest120Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest120Exception(message: 'message');
      final code = PostgrestError.pgrst120.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest200Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest200Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest200Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest200Exception(message: 'message');
      final code = PostgrestError.pgrst200.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest201Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest201Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest201Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest201Exception(message: 'message');
      final code = PostgrestError.pgrst201.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest202Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest202Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest202Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest202Exception(message: 'message');
      final code = PostgrestError.pgrst202.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest203Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest203Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest203Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest203Exception(message: 'message');
      final code = PostgrestError.pgrst203.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest204Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest204Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest204Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest204Exception(message: 'message');
      final code = PostgrestError.pgrst204.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest300Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest300Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest300Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest300Exception(message: 'message');
      final code = PostgrestError.pgrst300.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest301Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest301Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest301Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest301Exception(message: 'message');
      final code = PostgrestError.pgrst301.code;
      expect(exception.code, code);
    });
  });

  group('Postgrest302Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest302Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest302Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest302Exception(message: 'message');
      final code = PostgrestError.pgrst302.code;
      expect(exception.code, code);
    });
  });

  group('PostgrestX00Exception', () {
    test('can be instantiated', () {
      expect(
        PostgrestX00Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<PostgrestX00Exception>(),
      );
    });

    test('code is correct', () {
      final exception = PostgrestX00Exception(message: 'message');
      final code = PostgrestError.pgrstX00.code;
      expect(exception.code, code);
    });
  });
}
