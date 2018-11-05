solution 'spasm'
    configurations {'Debug', 'Release'}
    platforms { 'x64' }
    flags {
        'FatalWarnings',
        'ExtraWarnings',
        'Cpp14',
        'Symbols',
    }

	defines {
		'_SCL_SECURE_NO_WARNINGS',
	}

    local root = '../build/'

    configuration 'Debug'
        targetdir(root .. 'bin/Debug')
        objdir(root .. 'obj/Debug')

    configuration 'Release'
        flags 'OptimizeSpeed'
        targetdir(root .. 'bin/Release')
        objdir(root .. 'obj/Release')
    configuration '*'

    project 'sprt'
        kind 'StaticLib'
        language 'C++'
        uuid(os.uuid('sprt'))
        files '../src/*.cpp'
        removefiles '../src/main.cpp'
        files '../src/*.h'

    project 'spasm'
        kind 'ConsoleApp'
        language 'C++'
        uuid(os.uuid('spasm'))
        files '../src/asm/*.cpp'
        removefiles {
            '../src/asm/lexdump.cpp',
            '../src/asm/lexdump3.cpp',
        }
        files '../src/asm/*.h'

    project 'sprun'
        kind 'ConsoleApp'
        language 'C++'
        uuid(os.uuid('sprun'))
        files '../src/main.cpp'
        links 'sprt'

    -- include '../test'
    startproject 'sprun'
