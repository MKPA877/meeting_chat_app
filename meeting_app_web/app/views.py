from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.db.models import Q
from django.contrib import messages
from .forms import *
from .models import *
from .utils import *



def index_view(request):
    if request.method == 'POST' and 'Continuer' in request.POST:
        return redirect('login')  # Redirection vers la page de connexion
    return render(request, 'index.html')



def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                try:
                    user_preferences = CentresDInteret.objects.get(user=user)
                    return redirect('compatible_profils') 
                except CentresDInteret.DoesNotExist:
                    return redirect('preferences')
            else:
                messages.error(request, "Nom d'utilisateur ou mot de passe incorrect. Peut-être que vous n'avez pas de compte.")
    else:
        form = LoginForm()
    return render(request, 'login.html', {'form': form})






def signup_view(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            if user is not None:
                login(request, user)
                return redirect('login')  # Rediriger l'utilisateur vers la page d'accueil après inscription
            else:
                messages.error(request, "Authentication failed. Please try again.")
        else:
            # Collect form errors to display them
            for field, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f"{field}: {error}")
    else:
        form = SignUpForm()
    
    return render(request, 'inscription.html', {'form': form})



@login_required
def preference_view(request):
    # Attempt to get the user's CentresDInteret instance, or create one if it doesn't exist
    try:
        centres_d_interet = request.user.centres_d_interet
    except CentresDInteret.DoesNotExist:
        centres_d_interet = CentresDInteret(user=request.user)
        centres_d_interet.save()

    # Initialize the form with the instance
    form = PreferenceForm(instance=centres_d_interet)

    # Handle POST request
    if request.method == "POST":
        form = PreferenceForm(request.POST, instance=centres_d_interet)
        if form.is_valid():
            form.save()
            return redirect('compatible_profils')  # Replace with the actual success URL

    return render(request, 'preferences.html', {'form': form})


@login_required
def compatible_profiles(request):
    user = request.user
    compatible_users = find_compatible_users(user)
    return render(request, 'compatible_profils.html', {'compatible_users': compatible_users})

@login_required
def conversations_view(request):
    user = request.user
    connections = Connection.objects.filter(
        (Q(sender=user) | Q(receiver=user)) & Q(accepted=True)
    ).distinct()

    context = []
    for connection in connections:
        last_message = connection.messages.order_by('-date_envoi').first()
        other_participant = connection.receiver if connection.sender == user else connection.sender
        context.append({
            'connection': connection,
            'last_message': last_message,
            'other_participant': other_participant,
        })
    return render(request, 'conversations.html', {'conversations': context})


"""def suggestions_view(request):
    user_profile = request.user.userprofile
    
    # Récupération de tous les profils d'utilisateurs de sexe opposé
    opposite_profiles = User.objects.exclude(id=request.user.id).filter(gender='F' if user_profile.gender == 'M' else 'M')
    
    suggestions = []

    for profile in opposite_profiles:
        common_percentage = calculate_common_percentage(user_profile, profile.userprofile)
        suggestions.append((profile, common_percentage))

    # Triage des suggestions par pourcentage de points communs (ordre décroissant)
    suggestions = sorted(suggestions, key=lambda x: x[1], reverse=True)

    return render(request, 'suggestions.html', {'suggestions': suggestions})"""


@login_required
def private_chat_redirect(request, username):
    user1 = request.user
    user2 = get_object_or_404(User, username=username)
    
    if user1 == user2:
        return redirect('some_error_page')  # Rediriger vers une page d'erreur ou gérer le cas
    
    # Vérifiez si une connexion existe déjà entre ces utilisateurs
    connection = Connection.objects.filter(
        (Q(sender=user1) & Q(receiver=user2)) | (Q(sender=user2) & Q(receiver=user1))
    ).first()
    
    if not connection:
        connection = Connection.objects.create(sender=user1, receiver=user2, accepted=True)
    
    chat = PrivateChat.objects.filter(connection=connection).first()
    if not chat:
        chat = PrivateChat.objects.create(connection=connection)
    
    return redirect('chat_room', chat_id=chat.id)


@login_required
def chat_room(request, chat_id):
    room_name = chat_id
    # Récupérer la connexion correspondant à la salle de chat spécifiée
    connection = get_object_or_404(Connection, accepted=True)
    # Récupérer tous les messages associés à cette connexion
    messages = Message.objects.filter(connection=connection).order_by('date_envoi')
    return render(request, 'chat_room.html', {
        'room_name': room_name,
        'connection_id': connection.id,  # Passer l'ID de la connexion au template
        'messages': messages
    })



@login_required 
def upload_profile_picture(request):
    if request.method == 'POST':
        form = ProfilePictureForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('upload_profile_picture')
    else:
        form= ProfilePictureForm(instance=request.user)
    return render(request, 'gest_profil.html', {'form': form})

@login_required 
def change_username(request):
    if request.method == 'POST':
        form = UsernameChangeform(request.POST,instance=request.user)
        if form.is_valid():
            form.save()
            messages.sucess(request, 'Your username has been updated successfully!')
            return redirect('change_username')
        else:
            form = UsernameChangeform(instance=request.user)
        return render(request, 'gest_profil.html', {'form': form}) 

@login_required 
def change_bio(request):
    if request.method == 'POST':
        form = BioChangeForm(request.POST,instance=request.user)
        if form.is_valid():
            form.save()
            messages.sucess(request, 'Your bio has been updated successfully!')
            return redirect('change_bio')
        else:
            form = BioChangeForm(instance=request.user)
        return render(request, 'gest_profil.html', {'form': form}) 


@login_required
def send_invitation(request, to_username):
    if request.method == 'POST':
        from_user = request.user
        to_user = get_object_or_404(User, username=to_username)
        
        # Vérifier si une connexion existe déjà dans les deux sens
        connection_exists = Connection.objects.filter(
            Q(sender=from_user, receiver=to_user) | Q(sender=to_user, receiver=from_user)
        ).exists()
        
        if not connection_exists:
            # Créer une invitation
            Connection.objects.create(sender=from_user, receiver=to_user, accepted=False)
            messages.success(request, "Invitation envoyée avec succès.")
            return redirect('notification_list')  # Rediriger vers la nouvelle page de notifications
        else:
            messages.error(request, "Une connexion existe déjà.")
    return render(request, 'compatible_profils.html')

@login_required
def accept_invitation(request, connection_id):
    connection = get_object_or_404(Connection, id=connection_id)
    if connection.receiver == request.user:
        connection.accepted = True
        connection.save()
        return redirect('notification_list')  # Rediriger vers la nouvelle page de notifications
    else:
        return redirect('notification_list')
    

@login_required
def notification_list(request):
    received_invitations = Connection.objects.filter(receiver=request.user, accepted=False)
    sent_invitations = Connection.objects.filter(sender=request.user, accepted=False)
    context = {
        'received_invitations': received_invitations,
        'sent_invitations': sent_invitations,
    }
    return render(request, 'notification_list.html', context)




@login_required
def go_to_gest_profil(request):
    return render(request, 'gest_profil.html')




@login_required
def go_to_conversationList(request):
    return render(request, 'conversations.html')