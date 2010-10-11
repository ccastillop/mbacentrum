class ComentarioMailer < ActionMailer::Base
  default :from => "robot@mbacentrum.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comentario_mailer.notifica.subject
  #
  def notifica(comentario)
    @comentario = comentario   
    mail  :to => comentario.comentable.user.email,
          :reply_to => comentario.user.email,
          :bcc => comentario.comentable.comentarios.map{|c| c.user.email}.uniq,
          :subject => "[MBAcentrum.com] Nuevo comentario sobre #{comentario.comentable}"
          
  end
end
