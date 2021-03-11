        </div> <!-- FIM CONTAINER  -->
    </div> <!-- FIM CONTAINER-FUID -->
</body>
    <script>
        $(document).ready(function() {
            //DATETIME
            $(".datepicker").datepicker({
                timepicker:true,
                step:5,
                format:'d/m/Y H:i',
                formatDate:'d/m/Y H:i'		
            });
            
            $(".datepicker-dmy").datepicker({
                language: "pt-BR",
                format:'dd/mm/yyyy',
                autoclose: true,
            });

            $(".datepicker-my").datepicker({
                language: "pt-BR",
                autoclose: true,
                minViewMode: 1,
                format:'mm/yyyy',
            }); 
    
            //DATATEBLE
            $(".datatable").dataTable({
                "bJQueryUI": false,
                "sPaginationType": "full_numbers",
                // "sDom": '<"H"Tlfr>t<"F"ip>',
                "oLanguage": {
                    "sLengthMenu": "Mostrar _MENU_ registros por página",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sInfo": "Mostrando _START_ / _END_ de _TOTAL_ registro(s)",
                    "sInfoEmpty": "Mostrando 0 / 0 de 0 registros",
                    "sInfoFiltered": "(filtrado de _MAX_ registros)",
                    "sSearch": "Pesquisar: ",
                    "oPaginate": {
                        "sFirst": "Início",
                        "sPrevious": "Anterior",
                        "sNext": "Próximo",
                        "sLast": "Último"
                    }
                },
                "order": [],
                "lengthMenu":[[5,30,100,-1],[5,30,100,'Todos']],
                "bPaginate":true,	
                "aaSorting": [[0, 'desc']],
                "aoColumnDefs": [
                    {"sType": "num-html", "aTargets": [0]},
                    { "bSortable": false, "aTargets": [3] }
                ]
            });

            $('.showPassword').on('click', function(){
                var idPass = $(this).data('id');
                var passwordField = $('#'+idPass);
                var passwordFieldType = passwordField.attr('type');

                if (passwordFieldType == 'password') {
                    passwordField.attr('type', 'text');
                    $(this).html('<i class="far fa-eye-slash"></i>');
                } else {
                    passwordField.attr('type', 'password');
                    $(this).html('<i class="far fa-eye"></i>');
                }
            });
            
            $('[data-toggle="tooltip"]').tooltip()
            //$('button').tooltip();
        });

        //GERA SENHA 
        function geraPassword() {
            var pass = '';
            var chars = 8; //QUANTIDADE DE CARACTERES DA SENHA

            generate = function(chars) {
                for (var i = 0; i < chars; i++) {
                    pass = pass + getRandomChar();
                }
                $('.showpass').val(pass);
                //document.getElementById('password').value = pass;
            }

            this.getRandomChar = function() {
                var ascii = [[48, 57], [97, 122]];
                var i = Math.floor(Math.random()*ascii.length);
                return String.fromCharCode(Math.floor(Math.random()*(ascii[i][1]-ascii[i][0]))+ascii[i][0]);
            }
            generate(chars);
        }

        //BOTÃO VOLTAR PÁGINA
        function backPage() {
            //location.href = document.referrer;
            history.go(-1);
        }
    </script>
</html>