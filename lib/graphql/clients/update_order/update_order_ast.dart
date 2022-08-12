// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const mutation = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'updateOrder'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'updateOneUser'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'where'),
                value: _i1.ObjectValueNode(fields: [
                  _i1.ObjectFieldNode(
                      name: _i1.NameNode(value: 'id'),
                      value: _i1.StringValueNode(
                          value: 'TuyoLCVuK1VTMIXwFHxWrniFRLn1',
                          isBlock: false))
                ])),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'data'),
                value: _i1.ObjectValueNode(fields: [
                  _i1.ObjectFieldNode(
                      name: _i1.NameNode(value: 'ordered'),
                      value: _i1.ObjectValueNode(fields: [
                        _i1.ObjectFieldNode(
                            name: _i1.NameNode(value: 'update'),
                            value: _i1.ListValueNode(values: [
                              _i1.ObjectValueNode(fields: [
                                _i1.ObjectFieldNode(
                                    name: _i1.NameNode(value: 'where'),
                                    value: _i1.ObjectValueNode(fields: [
                                      _i1.ObjectFieldNode(
                                          name: _i1.NameNode(value: 'id'),
                                          value: _i1.StringValueNode(
                                              value:
                                                  'cl2nayomr0214g7r3qoclrgtf',
                                              isBlock: false))
                                    ])),
                                _i1.ObjectFieldNode(
                                    name: _i1.NameNode(value: 'data'),
                                    value: _i1.ObjectValueNode(fields: [
                                      _i1.ObjectFieldNode(
                                          name: _i1.NameNode(value: 'quantity'),
                                          value: _i1.ObjectValueNode(fields: [
                                            _i1.ObjectFieldNode(
                                                name:
                                                    _i1.NameNode(value: 'set'),
                                                value: _i1.IntValueNode(
                                                    value: '14'))
                                          ]))
                                    ]))
                              ]),
                              _i1.ObjectValueNode(fields: [
                                _i1.ObjectFieldNode(
                                    name: _i1.NameNode(value: 'where'),
                                    value: _i1.ObjectValueNode(fields: [
                                      _i1.ObjectFieldNode(
                                          name: _i1.NameNode(value: 'id'),
                                          value: _i1.StringValueNode(
                                              value:
                                                  'cl2ncf6k80007zpr30n3g1ymu',
                                              isBlock: false))
                                    ])),
                                _i1.ObjectFieldNode(
                                    name: _i1.NameNode(value: 'data'),
                                    value: _i1.ObjectValueNode(fields: [
                                      _i1.ObjectFieldNode(
                                          name: _i1.NameNode(value: 'quantity'),
                                          value: _i1.ObjectValueNode(fields: [
                                            _i1.ObjectFieldNode(
                                                name:
                                                    _i1.NameNode(value: 'set'),
                                                value: _i1.IntValueNode(
                                                    value: '20'))
                                          ]))
                                    ]))
                              ])
                            ]))
                      ]))
                ]))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'message'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'data'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FragmentSpreadNode(
                      name: _i1.NameNode(value: 'userInfo'), directives: [])
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [mutation]);
